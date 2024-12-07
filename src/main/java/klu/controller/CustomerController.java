package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import klu.model.Customer;
import klu.model.CustomerManager;

@RestController
@RequestMapping("/customer")
public class CustomerController 
{
	@Autowired
	CustomerManager CM;
	
	@PostMapping("/save")
	public String saveCustomer(@RequestBody Customer C)
	{
		return CM.addCustomer(C);
		
	}
	
	@GetMapping("/read")
	public String readCustomer()
	{
		return CM.getCustomer().toString();
	}

}
