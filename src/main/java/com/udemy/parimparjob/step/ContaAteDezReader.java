package com.udemy.parimparjob.step;

import java.util.Arrays;
import java.util.List;

import org.springframework.batch.item.support.IteratorItemReader;

public class ContaAteDezReader {

  public static IteratorItemReader<Integer> executa() {
    List<Integer> numerosDeUmAteDez = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
		return new IteratorItemReader<Integer>(numerosDeUmAteDez.iterator());
  }
  
}
