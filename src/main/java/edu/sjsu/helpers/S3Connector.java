package edu.sjsu.helpers;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.PutObjectRequest;

import java.io.File;

public class S3Connector {

	private static String bucketName = "resonance-295";
	private static String access_key_id = "";

	private static String secret_access_key = "";

	public String uploadFile(String fileName, String uploadFilePath) {

		BasicAWSCredentials awsCreds = new BasicAWSCredentials(access_key_id, secret_access_key);
		AmazonS3Client s3client = new AmazonS3Client(awsCreds);

		String url=null;
		
		try {
			System.out.println("Uploading a new object to S3 from a file\n");
			File file = new File(uploadFilePath);
			s3client.putObject(new PutObjectRequest(bucketName, fileName, file));
			url = s3client.getResourceUrl(bucketName, fileName);
			System.out.println(url);
		
			return url;

		} catch (AmazonServiceException ase) {
			System.out.println("Caught an AmazonServiceException, which " + "means your request made it "
					+ "to Amazon S3, but was rejected with an error response" + " for some reason.");
			System.out.println("Error Message:    " + ase.getMessage());
			System.out.println("HTTP Status Code: " + ase.getStatusCode());
			System.out.println("AWS Error Code:   " + ase.getErrorCode());
			System.out.println("Error Type:       " + ase.getErrorType());
			System.out.println("Request ID:       " + ase.getRequestId());
		} catch (AmazonClientException ace) {
			System.out.println("Caught an AmazonClientException, which " + "means the client encountered "
					+ "an internal error while trying to " + "communicate with S3, "
					+ "such as not being able to access the network.");
			System.out.println("Error Message: " + ace.getMessage());
		}
		return url;
	}
	

}
