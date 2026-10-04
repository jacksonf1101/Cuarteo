-- =====================================================================
-- Cuarteo V 1.6: esquema de base de datos para Supabase
-- Cómo usarlo: Supabase > SQL Editor > New query > pega todo > Run.
-- Se puede ejecutar más de una vez sin dañar los datos.
-- =====================================================================

-- Estudios de caracterización (un registro por estudio, guardado como JSON)
create table if not exists public.campanas (
  owner uuid not null default auth.uid() references auth.users (id) on delete cascade,
  id text not null,
  data jsonb not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (owner, id)
);

-- Ajustes y catálogo de cada usuario
create table if not exists public.config (
  owner uuid primary key default auth.uid() references auth.users (id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

-- Seguridad: cada usuario solo ve y modifica sus propios datos
alter table public.campanas enable row level security;
alter table public.config enable row level security;

drop policy if exists "cuarteo_campanas_propias" on public.campanas;
create policy "cuarteo_campanas_propias" on public.campanas
  for all to authenticated
  using (owner = (select auth.uid()))
  with check (owner = (select auth.uid()));

drop policy if exists "cuarteo_config_propia" on public.config;
create policy "cuarteo_config_propia" on public.config
  for all to authenticated
  using (owner = (select auth.uid()))
  with check (owner = (select auth.uid()));

-- Fotos: bucket privado; cada usuario usa su propia carpeta (<id de usuario>/archivo.jpg)
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('fotos', 'fotos', false, 5242880, array['image/jpeg', 'image/png', 'image/webp'])
on conflict (id) do nothing;

drop policy if exists "cuarteo_fotos_leer" on storage.objects;
create policy "cuarteo_fotos_leer" on storage.objects for select to authenticated
  using (bucket_id = 'fotos' and (storage.foldername(name))[1] = (select auth.uid())::text);

drop policy if exists "cuarteo_fotos_subir" on storage.objects;
create policy "cuarteo_fotos_subir" on storage.objects for insert to authenticated
  with check (bucket_id = 'fotos' and (storage.foldername(name))[1] = (select auth.uid())::text);

drop policy if exists "cuarteo_fotos_actualizar" on storage.objects;
create policy "cuarteo_fotos_actualizar" on storage.objects for update to authenticated
  using (bucket_id = 'fotos' and (storage.foldername(name))[1] = (select auth.uid())::text);

drop policy if exists "cuarteo_fotos_borrar" on storage.objects;
create policy "cuarteo_fotos_borrar" on storage.objects for delete to authenticated
  using (bucket_id = 'fotos' and (storage.foldername(name))[1] = (select auth.uid())::text);
