import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    FileInputStream(keystorePropertiesFile).use { keystoreProperties.load(it) }
} else {
    println("⚠️ WARNING: key.properties no encontrado en la raíz del proyecto $keystorePropertiesFile")
}

android {
    namespace = "com.readmind"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        // ⭐ NUEVO ⭐ — requerido por flutter_local_notifications
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true   // <-- IMPORTANTE
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()   // actualizado para empatar
    }

    defaultConfig {
        applicationId = "com.readmind"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String?
            storeFile = file(keystoreProperties["storeFile"] as String)
            storePassword = keystoreProperties["storePassword"] as String?
        }
    }

    flavorDimensions += "env"

    productFlavors {
        create("dev") {
            dimension = "env"
            applicationId = "com.readmind.dev"
            versionNameSuffix = "-dev"
            resValue("string", "app_name", "ReadMind Dev")
            signingConfig = signingConfigs.getByName("release")
        }
        create("prod") {
            dimension = "env"
            applicationId = "com.readmind.ai"
            versionNameSuffix = "-prod"
            resValue("string", "app_name", "ReadMind AI")
            signingConfig = signingConfigs.getByName("release")
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
        }
        getByName("debug") {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}

// ⭐ NUEVO ⭐ — dependencia obligatoria para desugaring
dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
}
