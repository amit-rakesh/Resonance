package edu.sjsu.recommendation;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class DataWriter {

	public boolean processHeartBeatData(long userId, long songId, String body) {
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = null;
		try {
			rootNode = mapper.readTree(body);
			System.out.println("rootNode: " + rootNode);
		} catch (Exception e) {
			e.printStackTrace();
		}

		JsonNode heartIntraday = rootNode.path("activities-heart-intraday");
		JsonNode dataset = heartIntraday.path("dataset");
		if (dataset.isArray()) {
			System.out.println("dataset node is an array: ");
		}
		JsonNode startHeartBeatNode = dataset.get(0);
		long startHeartBeat = startHeartBeatNode.path("value").longValue();

		JsonNode endHeartBeatNode = dataset.get(4);
		long endHeartBeat = endHeartBeatNode.path("value").longValue();

		return writeData(userId, songId, startHeartBeat, endHeartBeat);
	}

	private boolean writeData(long userId, long songId, long startHeartBeat, long endHeartBeat) {

		double relaxingSong = 0;
		boolean fileWriteDone = false;


		File file = new File("H:/harkirat/Study/sem4/Project-3-31/Resonance-1/Data1.csv");
		File completeFile = new File(
				"H:/harkirat/Study/sem4/Project-3-31/Resonance-1/CompleteFitbitData.csv");


		try {
			file.createNewFile();
			FileWriter writer = new FileWriter(file, true);
			if (endHeartBeat < startHeartBeat) {
				long diff = startHeartBeat - endHeartBeat;
				System.out.println("diff: " + diff + " endHeartBeat: " + endHeartBeat + "..." + "start Heartbeat: " + startHeartBeat);
				String output = userId + "," + songId;
				writer.write(output);
				writer.write("\n");

				/******
				 * Right now not using for fitbit recommendation because it
				 * depends only on lowering of heartbeat
				 */
				/*
				 * if(diff<=20) relaxingSong = 1.0; else if(diff>20 && diff<=40)
				 * relaxingSong = 2.0; else if(diff>40 && diff<=60) relaxingSong
				 * = 3.0; else if(diff>60 && diff<=80) relaxingSong = 4.0; else
				 * if(diff>80) relaxingSong = 5.0;
				 */
			} else {
				relaxingSong = 0;
			}

			writer.flush();
			writer.close();

			fileWriteDone = true;

		} catch (IOException e) {

			e.printStackTrace();
		}

		try {
			completeFile.createNewFile();
			FileWriter writer1 = new FileWriter(completeFile, true);
			String wholeOutput = startHeartBeat + "," + endHeartBeat + "," + userId + "," + songId + "," + relaxingSong;
			writer1.write(wholeOutput);
			writer1.write("\n");

			writer1.flush();
			writer1.close();
		} catch (IOException e) {

			e.printStackTrace();
		}

		return fileWriteDone;

	}
}
