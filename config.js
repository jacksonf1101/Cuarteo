// Configuración de Cuarteo para tu proyecto de Supabase.
// Copia estos dos datos de Supabase > Project Settings > API (o Data API / API Keys).
// - supabaseUrl: "Project URL"
// - supabaseAnonKey: clave "anon public" o "publishable".
//   NUNCA pegues aquí la clave "service_role" ni la "secret".
window.CUARTEO_CONFIG = {
  supabaseUrl: 'https://kalzxqtnmijhgydhakou.supabase.co',
  supabaseAnonKey: 'sb_publishable_ASmEUhq8iGxFZPCkcxvaZw_Vx_iHkHv',
   privacidad: {
    responsable: 'Ministerio de Medio Ambiente y Recursos Naturales, Dirección de Gestión Integral de Residuos Sólidos',
    contacto: 'sofia.qureshi@ambiente.gob.do'
  },
  marca: {
    nombre: 'Plataforma de Caracterización de Residuos Sólidos',
    nombreCorto: 'Caracterización de Residuos',
    institucion: 'Ministerio de Medio Ambiente y Recursos Naturales',
    dependencia: 'Dirección de Gestión Integral de Residuos Sólidos',
    logo: 'logo-mmarn.png',
    colores: { principal: '#032A5A', oscuro: '#021C3D', acento: '#E11516', fondo: '#EAF4FB' },
    autor: 'JC Waste Management',
    normativa: 'Ley 225-20 General de Gestión Integral y Coprocesamiento de Residuos Sólidos, su reglamento (Decreto 320-21) y Ley 98-25, República Dominicana'
  }
};
