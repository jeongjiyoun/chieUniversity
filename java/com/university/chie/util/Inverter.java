package com.university.chie.util;

import org.springframework.stereotype.Service;

@Service
public class Inverter {

	public boolean invertBoolean(int result) {
		if (result == 1) {
			return true;
		} else {
			return false;
		}
	}
	
}
