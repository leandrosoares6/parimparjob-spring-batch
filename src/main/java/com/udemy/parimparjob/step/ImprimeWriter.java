package com.udemy.parimparjob.step;

import org.springframework.batch.item.ItemWriter;

public class ImprimeWriter {

  public static ItemWriter<String> imprime() {
		return itens -> itens.forEach(System.out::println); 
	}
  
}
