<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit9cf472f2da3204a300d0a9ee3133f453
{
    public static $classMap = array (
        'Format' => __DIR__ . '/..' . '/chriskacerguis/codeigniter-restserver/application/libraries/Format.php',
        'REST_Controller' => __DIR__ . '/..' . '/chriskacerguis/codeigniter-restserver/application/libraries/REST_Controller.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->classMap = ComposerStaticInit9cf472f2da3204a300d0a9ee3133f453::$classMap;

        }, null, ClassLoader::class);
    }
}
