package com.udemy.parimparjob.step;

import org.springframework.batch.item.function.FunctionItemProcessor;

public class ParOuImparStepProcessor {

  public static FunctionItemProcessor<Integer, String> processa() {
		return new FunctionItemProcessor<Integer, String>
		(item -> item % 2 == 0 ? String.format("Item %s é Par", item) : String.format("Item %s é Ímpar", item));
	}
}
