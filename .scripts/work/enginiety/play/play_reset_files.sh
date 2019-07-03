#!/usr/bin/env bash
source $HOME/.config/scripts/personal.conf
cd $PLAY_GIT
git checkout HEAD -- $PLAY_GIT/play/playstorefront/web/webroot/_ui/desktop/theme-blue/multi/src/ng2-app/scripts/customer-offer/addons/common-addons.service.ts
git checkout HEAD -- $PLAY_GIT/play/playstorefront/web/webroot/_ui/desktop/theme-blue/multi/src/ng2-app/scripts/customer-offer/addons/prime-addons.service.ts
git checkout HEAD -- $PLAY_GIT/play/playstorefront/web/webroot/_ui/desktop/theme-blue/multi/src/ng2-app/scripts/customer-offer/addons/slot-addons.service.ts
cd -
