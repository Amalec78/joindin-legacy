#!/bin/bash
TARGETBASE=/var/www/joind.in
TARGET=${TARGETBASE}/${BUILD_NUMBER}
LAUNCHREF=remotes/magicmonkey/ci-tools

sg web -c "
mkdir -p $TARGET \
 ; git archive $LAUNCHREF | tar xC $TARGET \
&& ln -s $TARGETBASE/config.php $TARGET/src/system/application/config/config.php \
&& ln -s $TARGETBASE/database.php $TARGET/src/system/application/config/database.php \
&& mv $TARGET/src/inc/img/event_icons $TARGET/src/inc/img/event_icons.removed \
&& ln -s $TARGETBASE/tmp/event_icons $TARGET/src/inc/img/event_icons \
&& ln -s $TARGET $TARGETBASE/www.new \
&& $TARGET/src/scripts/patchdb.sh \
&& mv -Tf $TARGETBASE/www.new $TARGETBASE/www
"


