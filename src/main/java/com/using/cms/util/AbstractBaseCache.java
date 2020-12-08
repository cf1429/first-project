package com.using.cms.util;

import com.using.cms.service.ICacheCaller;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.TimeoutException;

public abstract class AbstractBaseCache {

    /** 3秒 */
    public final static long EXPIRES_LEVEL_THREE_SECOND = 3L;
    /** 1分钟 **/
    public final static long EXPIRES_LEVEL_FIVE_MIN =60L;
    /** 1小时 **/
    public final static long EXPIRES_LEVEL_HOUR =60L*60L;
    /** 1天 **/
    public final static long EXPIRES_LEVEL_DAY = 60L*60L*24L;
    /** 7天 **/
    public final static long EXPIRES_LEVEL_WEEK = 60L*60L*24L*7L;
    /** 30天 **/
    public final static long EXPIRES_LEVEL_MONTH = 60L*60L*24L*30L;

    /**
     * 取默认的缓存键值，此方法只能在要缓存的方法中调用，objs为要缓存方法传入的参数。此方法支持一级bean，但不支持多级
     * @param objs
     * @return
     */
    public String getDefaultCacheKey(Object... objs) {
        String clazzName = Thread.currentThread().getStackTrace()[2].getClassName();
        String methodName = Thread.currentThread().getStackTrace()[2].getMethodName();
        String paramValue = "";
        if (objs != null) {
            try {
                for (Object obj : objs) {
                    if (obj == null) {
                        paramValue += "|null";
                        continue;
                    }
                    String objName = obj.getClass().getName();
                    if (objName.indexOf("java") != 0) {
                        do {
                            Class<?> cls = Class.forName(objName);
                            Field[] fields=cls.getDeclaredFields();
                            for(Field f : fields){
                                StringBuffer sb = new StringBuffer(f.getName());
                                sb.setCharAt(0, Character.toUpperCase(f.getName().charAt(0)));

                                Method metd = obj.getClass().getMethod("get" + sb.toString());
                                Object fieldValue = metd.invoke(obj);
                                paramValue += "|" + fieldValue;
                            }
                            //查看父类
                            Class<?> superClass = cls.getSuperclass();
                            objName = superClass.getName();
                        } while (objName.indexOf("java") != 0);

                    } else {
                        paramValue += "|" + obj;
                    }
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (SecurityException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        String result = clazzName + "." + methodName + (paramValue.equals("") ? "()" : "(" + paramValue.substring(1) + ")");

        return result;
    }

    /**
     * 清除缓存值为指定的类的缓存
     * @param clazz
     */
//	public abstract void removeValueByClassType(Class clazz);

    /**
     * 清除缓存中键值为某一字符串前缀的缓存
     * @param preStr
     */
    public abstract void removeKeyByPreTag(String preStr);

    /**
     * 将某对象放入缓存
     * @param key 缓存键值
     * @param obj 缓存对象
     * @throws MemcachedException
     * @throws InterruptedException
     * @throws TimeoutException
     */
    public abstract void put(String key, Object obj);

    /**
     * 将某对象放入缓存，并且指定过期时间
     * @param key 缓存键值
     * @param obj 缓存对象
     * @param timeout 缓存过期时间，单位：秒
     * @throws MemcachedException
     * @throws InterruptedException
     * @throws TimeoutException
     */
    public abstract void put(String key, Object obj, long timeout);

    /**
     * 从缓存中读取某值，如果不存在，则调用caller读取，并存储指定的时间
     * @param key
     * @param caller
     * @param expires
     * @return
     */
    public abstract Object get(String key, ICacheCaller caller, long expires);

    /**
     * 从缓存中读取某值，如果不存在，则调用caller读取
     * @param key
     * @param caller
     * @return
     */
    public abstract Object get(String key, ICacheCaller caller);

    /**
     * 根据缓存键值取得缓存对象
     * @param key 缓存键值
     * @return 取回的缓存对象
     * @throws MemcachedException
     * @throws InterruptedException
     * @throws TimeoutException
     */
    public abstract Object get(String key);

    /**
     * 根据缓存键值删除某缓存对象
     * @param key 缓存键值
     * @throws MemcachedException
     * @throws InterruptedException
     * @throws TimeoutException
     */
    public abstract void remove(String key);

    /**
     * 删除缓存中的所有缓存
     */
    //public abstract void removeAll();

    /**
     * 替换缓存
     * @param key
     * @param obj
     * @return
     */
    public abstract boolean replace(String key, Object obj);
}
