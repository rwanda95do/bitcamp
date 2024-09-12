package com.jstl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class PersonDTO {
	@NonNull
	private String name;
	private int age;
	
}
