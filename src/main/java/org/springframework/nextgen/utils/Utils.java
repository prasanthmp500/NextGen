package org.springframework.nextgen.utils;

import io.iron.ironmq.Cloud;

/**
 * 
 * @author Prasanth M P
 * 
 * The utility class for storing the developer api keys.
 *
 */
public class Utils {
	private Utils() {}
	
	public static String LAST_FM_API_KEY = "3b0a68e77d37c16e8862d3f095b14013";
	
	public static String YOU_TUBE_API_KEY = "AIzaSyCvv1yvsXQiqYrkh_XQBo8TVKuRlaYqjSk";
	public static String GOOGLE_MAPS_API_KEY = "AIzaSyCvv1yvsXQiqYrkh_XQBo8TVKuRlaYqjSk";
	public static String ROTTEN_TOMATOES_API_KEY="t7gn2knkjujtcezx5fn3pktd";
	
	// iron mq credentionals
	public static String PROJECT_ID = "532cacd2b6c15300050000af";
	public static String TOKEN = "uxMQhGSOzstqdGl0X4qkKmil9rc";
	public static Cloud  CLOUD = Cloud.ironAWSUSEast;
	public static String QUEUE_NAME = "nextgen-feedbackform-queue";
}
