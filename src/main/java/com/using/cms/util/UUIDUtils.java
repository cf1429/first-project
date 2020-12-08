package com.using.cms.util;

import java.util.UUID;

public class UUIDUtils {
    public static String randReplacedLower(){
        return UUID.randomUUID().toString().replace("-", "").toLowerCase();
    }

}
