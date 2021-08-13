package com.udemy.parimparjob.step;

import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ImprimeParImparStepConfig {
  
  @Autowired
	private StepBuilderFactory stepBuilderFactory;

	@Bean
  public Step step() {
		return stepBuilderFactory
				.get("imprimeParImparStep")
				.<Integer, String>chunk(1)
				.reader(ContaAteDezReader.executa())
				.processor(ParOuImparStepProcessor.processa())
				.writer(ImprimeWriter.imprime())
				.build();
	}

}
