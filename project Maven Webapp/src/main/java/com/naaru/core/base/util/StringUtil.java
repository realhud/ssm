package com.naaru.core.base.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

/***
 * 字符串操作符工具类
 * 
 * @author zhupan
 * 
 */
public class StringUtil {
	/***
	 * 检查字符串中的分隔符的个数是否和params的长度一样 使用场景：sql语句中？个数和传递的参数长度是否一样
	 * 
	 * @param str
	 *            字符串
	 * @param params
	 *            参数列表
	 * @param split
	 *            字符串分隔符
	 * @return
	 */
	public static boolean checkParamsEqual(String str, Object[] params, String split) {
		int count1 = str != null ? ("@" + str + "@").split("\\" + split).length - 1 : 0;
		if (params == null && count1 > 0) {
			return false;
		}
		if (params != null && count1 != params.length) {
			return false;
		}
		return true;
	}

	/**
	 * 判断字符串是否为空
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		if (str == null || str.trim().length() == 0)
			return true;
		else
			return false;
	}

	/**
	 * 
	 * @Title: lpad
	 * @Description: TODO(字符串左补)
	 * @param src
	 * @param pad
	 * @param len
	 * @return String
	 * @throws
	 */
	public static String lpad(String src, char pad, int len) {
		String targ = src;
		while (targ.getBytes().length < len)
			targ = pad + targ;
		return targ;
	}

	public static String lpadZero(String src, char pad, int len) {
		String targ = src;
		for (int i = 0; i < len; i++) {
			targ = pad + targ;
		}
		return targ;
	}

	/**
	 * 
	 * @Title: rpad
	 * @Description: TODO(字符串右补)
	 * @param src
	 * @param pad
	 * @param len
	 * @return String
	 * @throws
	 */
	public static String rpad(String src, char pad, int len) {
		String targ = src;
		while (targ.getBytes().length < len)
			targ = targ + pad;
		return targ;
	}

	/**
	 * 
	 * @Title: interceptString
	 * @Description: TODO(从指定位置开始截取指定长度字符串)
	 * @param src
	 * @param beginIndex
	 * @param len
	 * @return String
	 * @throws
	 */
	public static String interceptString(String src, int beginIndex, int len) {
		if (src == null || src.length() == 0 || src.length() <= beginIndex || beginIndex < 0 || len <= 0)
			return "";
		StringBuffer targ = new StringBuffer();
		for (int i = 0; i < src.length(); i++) {
			if (i >= beginIndex && i < beginIndex + len)
				targ.append(src.charAt(i));
		}

		return targ.toString();
	}

	/**
	 * 校验身份证号码
	 */
	public static String checkCardId(String idCard) {
		String sex = "";

		String id = idCard;
		int id_length = id.length();

		if (id_length == 0) {
			return "请输入身份证号码!";
		}

		/*
		 * if (id_length!=15 && id_length!=18) { //alert("身份证号长度应为15位或18位！");
		 * return false; }
		 */

		if (id_length != 18) {
			return "身份证号长度应为18位！";
		}
		if (id_length == 18) {
			if (id.indexOf("X") > 0 && id.indexOf("X") != 17 || id.indexOf("x") > 0 && id.indexOf("x") != 17) {
				return "身份证中\"X\"输入位置不正确！";
			}

			String yyyy = id.substring(6, 10);
			if (yyyy.compareTo("2030") > 0 || yyyy.compareTo("1800") < 0) {
				return "输入身份证号,年度非法！";
			}

			String mm = id.substring(10, 12);
			if (mm.compareTo("12") > 0 || mm.compareTo("01") < 0) {
				return "输入身份证号,月份非法！";
			}

			String dd = id.substring(12, 14);
			if (dd.compareTo("31") > 0 || dd.compareTo("01") < 0) {
				return "输入身份证号,日期非法！";
			}

			if (id.charAt(17) == 'x' || id.charAt(17) == 'X') {
				if (!"x".equals(GetVerifyBit(id)) && !"X".equals(GetVerifyBit(id))) {
					return "身份证校验错误，请检查最后一位！";
				}

			} else {
				if (!String.valueOf(id.charAt(17) - 48).equals(GetVerifyBit(id))) {
					return "身份证校验错误，请检查最后一位！";
				}
			}

			String birthday = id.substring(6, 10) + "-" + id.substring(10, 12) + "-" + id.substring(12, 14);
			if ("13579".indexOf(id.substring(16, 17)) > -1) {
				sex = "1";// 男
			} else {
				sex = "0";// 女
			}
		}

		return sex;
	}

	// 15位转18位中,计算校验位即最后一位
	public static String GetVerifyBit(String id) {
		String result = "";
		int nNum = (Integer.valueOf(id.charAt(0) - 48) * 7 + Integer.valueOf(id.charAt(1) - 48) * 9 + Integer.valueOf(id.charAt(2) - 48) * 10 + Integer.valueOf(id.charAt(3) - 48) * 5
				+ Integer.valueOf(id.charAt(4) - 48) * 8 + Integer.valueOf(id.charAt(5) - 48) * 4 + Integer.valueOf(id.charAt(6) - 48) * 2 + Integer.valueOf(id.charAt(7) - 48) * 1
				+ Integer.valueOf(id.charAt(8) - 48) * 6 + Integer.valueOf(id.charAt(9) - 48) * 3 + Integer.valueOf(id.charAt(10) - 48) * 7 + Integer.valueOf(id.charAt(11) - 48) * 9
				+ Integer.valueOf(id.charAt(12) - 48) * 10 + Integer.valueOf(id.charAt(13) - 48) * 5 + Integer.valueOf(id.charAt(14) - 48) * 8 + Integer.valueOf(id.charAt(15) - 48) * 4 + Integer
				.valueOf(id.charAt(16) - 48) * 2);
		nNum = nNum % 11;
		switch (nNum) {
		case 0:
			result = "1";
			break;
		case 1:
			result = "0";
			break;
		case 2:
			result = "X";
			break;
		case 3:
			result = "9";
			break;
		case 4:
			result = "8";
			break;
		case 5:
			result = "7";
			break;
		case 6:
			result = "6";
			break;
		case 7:
			result = "5";
			break;
		case 8:
			result = "4";
			break;
		case 9:
			result = "3";
			break;
		case 10:
			result = "2";
			break;
		}
		return result;
	}

	/**
	 * 检查字符串是否为合法email地址
	 * 
	 * @param {String} 字符串
	 * @return {bool} 是否为合法email地址
	 */
	public static boolean isEmail(String email) {

		Pattern pattern = Pattern.compile("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$");
		Matcher matcher = pattern.matcher("a@aa.com");
		return (matcher.matches());
	}

	/**
	 * 验证手机号
	 * 
	 * @param mobiles
	 * @return
	 * 
	 */
	/*
	 * 根据实际开发于2009年9月7日最新统计：
	 * 中国发布3G号码段:中国联通185,186;中国移动188,187;中国电信189,180,181共7个号段。
	 * 3G业务专属的180-189号段已基本分配给各运营商使用,
	 * 其中180、181、189分配给中国电信,187、188归中国移动使用,185、186属于新联通。
	 * 中国移动拥有号码段：139、138、137、136
	 * 、135、134、159、158、157（3G）、152、151、150、188（3G）、187（3G）;14个号段
	 * 中国联通拥有号码段：130、131、132、155、156（3G）、186（3G）、185（3G）;6个号段
	 * 中国电信拥有号码段：133、153、189（3G）、180（3G）、181;5个号码段 移动:
	 * 2G号段(GSM网络)有139,138,137,136,135,134(0-8),159,158,152,151,150
	 * 3G号段(TD-SCDMA网络)有157,188,187 147是移动TD上网卡专用号段. 联通:
	 * 2G号段(GSM网络)有130,131,132,155,156 3G号段(WCDMA网络)有186,185 电信:
	 * 2G号段(CDMA网络)有133,153 3G号段(CDMA网络)有189,180,181
	 */
	public static boolean isMobileNO(String mobiles) {
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0-1,5-9]))\\d{8}$");
		Matcher m = p.matcher(mobiles);
		return m.matches();
	}

	/**
	 * 验证日期时间，解决润月
	 * 
	 * @param date
	 * @return
	 */
	public static boolean isDate(String date) {

		Pattern pattern = Pattern
				.compile("^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\\s(((0?[0-9])|([1-2][0-3]))\\:([0-5]?[0-9])((\\s)|(\\:([0-5]?[0-9])))))?$");
		Matcher matcher = pattern.matcher(date);// 2000-02-29 23:59:59
		return (matcher.matches());
	}

	public static boolean isIP(String ip) {
		Pattern pattern = Pattern
				.compile("\\b((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\.((?!\\d\\d\\d)\\d+|1\\d\\d|2[0-4]\\d|25[0-5])\\b");
		Matcher matcher = pattern.matcher(ip); // 以验证127.400.600.2为例
		return (matcher.matches());
	}

	public static String getNull(Object ob) {
		if (ob != null && ob != "null") {
			return ob.toString();
		} else {
			return "";
		}
	}

	public static boolean notNull(String s) {
		if (s == null || "".equals(s) || "null".equals(s) || "undefined".equals(s)) {
			return false;
		} else {
			return true;
		}

	}

	public static boolean hasVal(Object s) {
		if (s == null || "".equals(s + "") || "null".equals(s)) {
			return false;
		} else {
			return true;
		}

	}

	public static String getSixRandom() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			int random = (int) (Math.random() * 10);
			sb.append(random);
		}
		return sb.toString();
	}

	/**
	 * 除掉特殊字符
	 * 
	 * @param str
	 * 
	 *            return String
	 * */
	public static String StringFilter(String str) throws PatternSyntaxException {
		// 只允许字母和数字
		// String regEx = "[^a-zA-Z0-9]";
		// 清除掉所有特殊字符
		String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		return m.replaceAll("").trim();
	}

	/**
	 * 空处理
	 * 
	 * @param Object
	 * @return String
	 */
	public static String getString(Object str) {
		if ("".equals(str) || str == null || "null".equals(str)) {
			return "";
		} else {
			return str.toString();
		}
	}
}
