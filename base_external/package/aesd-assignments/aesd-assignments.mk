
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = eb87ffa49aca2ae46964a91cf2b75e3b0af0c2cc

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-sbaans.git
AESD_ASSIGNMENTS_SITE_METHOD = git

#AESD_ASSIGNMENTS_SITE = /home/sebbans/coursera/assignments-3-and-later-sbaans
#AESD_ASSIGNMENTS_SITE_METHOD = local

AESD_ASSIGNMENTS_GIT_SUBMODULES = YES



define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server
endef

# Install the server binary and its init script on the target
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
