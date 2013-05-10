//
//  Controller.cpp
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#include "Controller.h"

//Temp
#include <stdio.h>

Controller::Controller(NSWindow *win){
	window = [win retain];
	}

Controller::~Controller(){
	[window release];
	if(cloud){
		for(int a = 0; a < 2; a++)
			delete cloud[a];
		delete[] cloud;
		}
	}

void Controller::init(){
	customizeWindow();
	glController = new GLController(window);
	loadLogic();
	}

void Controller::update(){
	logic();
	rendering();
	}

void Controller::logic(){
	//if(cloud->count() < 50){
	//	printf("%i\n", cloud->count());
	//	cloud->addAtom(makeAtom(rand()%windowWidth, rand()%windowHeight, 5));
	//	}
	for(int a = 0; a < 2; a++)
		cloud[a]->update();
	}

void Controller::rendering(){
	glController->clear(0.6, 0.6, 0.6, 1);
	for(int a = 0; a < 2; a++){
		cloud[a]->updateVertexBuffer();
		glController->addAtomCloud(cloud[a]);
		}
	glController->render();
	}

void Controller::loadLogic(){
	srand((unsigned)time(NULL));
	cloud = new AtomCloud*[2];
	for(int a = 0; a < 2; a++)
		cloud[a] = new AtomCloud(50);
	
	cloud[0]->initBurst(50, 300, 200, 4, 2);
	cloud[0]->resizeAtoms(30, 0.5);
	cloud[0]->setGravSource(500, 250);
	cloud[1]->initBurst(50, 700, 200, 4, 2);
	cloud[1]->resizeAtoms(30, 0.5);
	}

void Controller::customizeWindow(){
	//TODO: Determine what the "display" attribute actually does.
	[window setFrame: CGRectMake(200, 200, windowWidth, windowHeight) display: YES];
	}

//End of file

