# uncrustify 0.61
# https://github.com/bengardner/uncrustify

# paths variables
EXEC_PATH=${SRCROOT}/Uncrustify/uncrustify
CONFIG_PATH=${SRCROOT}/Uncrustify/uncrustify_config.cfg

# executes uncrustfy
# sets language to Objective-C
# sets Quiet mode (no output)
# uses the config file CFG
# overrides all files
# fails silentely
${EXEC_PATH} -l OC -q -c ${CONFIG_PATH} ${SRCROOT}/**/*.[ch,cm] ../Source/*.[ch,cm] --no-backup stop > /dev/null 2>&1 || true