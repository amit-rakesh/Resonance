package edu.sjsu.controllers;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@ComponentScan
@Component("SongController")
@RequestMapping("/song/id")
public class SongController {

	@RequestMapping(method = RequestMethod.GET)
	public String showSong() {

		return "songs";

	}

}
