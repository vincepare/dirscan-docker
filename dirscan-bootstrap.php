<?php
/**
 * dirscan-docker bootstrap
 *
 * Some piece of black magic to make dirscan <= 1.2 working on the docker host from its container.
 *
 * @author Vincent Paré
 * @license http://opensource.org/licenses/Apache-2.0
 */

// Checking host root volume mount
if (!is_dir('/hostfs')) {
    fwrite(STDERR, 'Please mount / on /hostfs to let dirscan explore the host filesystem (ex: -v "/":"/hostfs:ro").' . "\n");
    die(1);
}

// Copying dirscan inside chroot + end cleanup
exec('cp -pv /tmp/.dirscan/dirscan /hostfs/tmp/.dirscan/dirscan');
register_shutdown_function(function () {
    unlink('/tmp/.dirscan/dirscan');
});

// chroot to host's filesystem
chroot('/hostfs');

// Go to PWD
if (!empty($_ENV['DIRSCAN_PWD'])) {
    chdir($_ENV['DIRSCAN_PWD']);
}
