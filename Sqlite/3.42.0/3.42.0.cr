class Target < ISM::Software
    
    def configure
        super

        configureSource(arguments:  "--prefix=/usr      \
                                    --disable-static    \
                                    --enable-fts{4,5}   \
                                    CPPFLAGS=\" -DSQLITE_ENABLE_COLUMN_METADATA=1   \
                                                -DSQLITE_ENABLE_UNLOCK_NOTIFY=1     \
                                                -DSQLITE_ENABLE_DBSTAT_VTAB=1       \
                                                -DSQLITE_SECURE_DELETE=1            \
                                                -DSQLITE_ENABLE_FTS3_TOKENIZER=1\"",
                        path:       buildDirectoryPath)
    end
    
    def build
        super

        makeSource(path: buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource( arguments:  "DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath} install",
                    path:       buildDirectoryPath)
    end

end
