//
//  Pipeline.cpp
//  AtomiC
//
//  Created by Parker Kemp on 5/9/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#include "Pipeline.h"

Pipeline::Pipeline(){
	program = glCreateProgram();
	}

Pipeline::~Pipeline(){
	}

GLuint Pipeline::loadGenericShader(const char *filename, GLenum type){
	GLuint shader;
	GLint compiled;
	char *code;
	
	//Get code from file
	code = shaderCode(filename);
	if(!code)
		return -1;

	shader = glCreateShader(type);
	
	//Load and compile code
	glShaderSource(shader, 1, &code, 0);
	glCompileShader(shader);

	//Check for compile errors
	glGetShaderiv(shader, GL_COMPILE_STATUS, &compiled);
	if(compiled)
		printf("Successfully compiled shader!\n");
	else{
		char log[200];
		printf("Failed to compile shader: %s\n", filename);
		glGetShaderInfoLog(shader, 200, 0, log);
		printf("%s\n", log);
		}
	
	return shader;
	}

void Pipeline::loadVertexShader(const char *filename){
	vertShader = loadGenericShader(filename, GL_VERTEX_SHADER);
	glAttachShader(program, vertShader);
	}

void Pipeline::loadFragmentShader(const char *filename){
	fragShader = loadGenericShader(filename, GL_FRAGMENT_SHADER);
	glAttachShader(program, fragShader);
	}

void Pipeline::linkProgram(){
	GLint linked;
	
	glLinkProgram(program);
	
	glGetProgramiv(program, GL_LINK_STATUS, &linked);
	if(linked)
		printf("Successfully linked program!\n");
	else{
		char log[200];
		printf("Failed to link program.\n");
		glGetProgramInfoLog(program, 200, 0, log);
		printf("%s\n", log);
		}
	}

void Pipeline::activate(){
	glUseProgram(program);
	}

void Pipeline::deactivate(){
	glUseProgram(0);
	}

char *shaderCode(const char *filename){
	char *code;
	int fileLength;
	
	std::ifstream file(filename, std::ios::in);
	if(!file){
		printf("Failed to open shader file.\n");
		return 0;
		}

	file.seekg(0, file.end);
	fileLength = (int)file.tellg();
	code = new char[fileLength + 1];
	//printf("%i\n", fileLength);
	
	file.seekg(0, file.beg);
	
	file.read(code, fileLength);
	code[fileLength] = '\0';

	return code;
	}