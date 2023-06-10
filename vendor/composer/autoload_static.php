<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit1c8dddfa891817c0e736ff1b5611db01
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPMailer\\PHPMailer\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPMailer\\PHPMailer\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpmailer/phpmailer/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit1c8dddfa891817c0e736ff1b5611db01::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit1c8dddfa891817c0e736ff1b5611db01::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit1c8dddfa891817c0e736ff1b5611db01::$classMap;

        }, null, ClassLoader::class);
    }
}
