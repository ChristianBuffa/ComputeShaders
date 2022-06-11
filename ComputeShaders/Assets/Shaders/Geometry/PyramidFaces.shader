// The shader name and folder as displayed in the shader picker dialog in a material
Shader "Custom/PyramidFaces" {
    Properties{
        // Shader properties which are editable in the material
        _MainTex("Texture", 2D) = "white" {}
        _PyramidHeight("Pyramid height", Float) = 1
    }
        SubShader{
            Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline" }

            // Forward Lit Pass. The main pass which renders colors
            Pass {

                Name "ForwardLit"
                Tags { "LightMode" = "UniversalForward" }
                Cull Back

                HLSLPROGRAM
            // Signal this shader requires geometry programs
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x
            #pragma target 2.0
            #pragma require geometry

            // Lighting and shadow keywords
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
            #pragma multi_compile _ _ADDITIONAL_LIGHTS
            #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
            #pragma multi_compile _ _SHADOWS_SOFT

            // Register our functions
            #pragma vertex Vertex
            #pragma geometry Geometry
            #pragma fragment Fragment

            // Include our logic file
            #include "PyramidFaces.hlsl"    

            ENDHLSL
        }

            // Shadow caster pass. This pass renders a shadow map.
            // We treat it almost the same, except strip out any color/lighting logic
            Pass {

                Name "ShadowCaster"
                Tags { "LightMode" = "ShadowCaster" }

                HLSLPROGRAM
            // Signal this shader requires geometry programs
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x
            #pragma target 2.0
            #pragma require geometry

            // This sets up various keywords for different light types and shadow settings
            #pragma multi_compile_shadowcaster

            // Register our functions
            #pragma vertex Vertex
            #pragma geometry Geometry
            #pragma fragment Fragment

            // Define a special keyword so our logic can change if inside the shadow caster pass
            #define SHADOW_CASTER_PASS

            // Include our logic file
            #include "PyramidFaces.hlsl"

            ENDHLSL
        }
        }
}