{ ... }:

{
  services.snapper = {
    # no snapshotRootOnBoot: it hardcodes "--config root"
    snapshotInterval = "hourly";
    cleanupInterval  = "daily";
    persistentTimer  = true;

    configs.home = {
      SUBVOLUME = "/home";
      FSTYPE    = "btrfs";
      ALLOW_USERS = [ "edvin" ];   # lets you run snapper without sudo

      TIMELINE_CREATE  = true;        # hourly snapshots
      TIMELINE_CLEANUP = true;        # prune on the cleanup timer

      TIMELINE_LIMIT_HOURLY    = 12;
      TIMELINE_LIMIT_DAILY     = 7;
      TIMELINE_LIMIT_WEEKLY    = 4;
      TIMELINE_LIMIT_MONTHLY   = 0;
      TIMELINE_LIMIT_QUARTERLY = 0;
      TIMELINE_LIMIT_YEARLY    = 0;
    };
  };
}

