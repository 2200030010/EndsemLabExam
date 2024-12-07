package klu.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import klu.repository.CustomerRepository;

@Service
public class CustomerManager 
{
    @Autowired
    CustomerRepository CR;
    
    public String addCustomer(Customer C)
    {
        CR.save(C); // INSERT OPERATION
        
        Map<String, String> resp = new HashMap<>();
        resp.put("code", "200");
        resp.put("msg", "New customer has been added");
        return toJSON(resp);
    }
    
    public List<String> getCustomer()
    {
        List<String> clist = new ArrayList<>();
        for(Customer C : CR.findAll())
        {
            clist.add(toJSON(C));
        }
        return clist;
    }
    
    public String toJSON(Object obj)
    {
        GsonBuilder GB = new GsonBuilder();
        Gson G = GB.create();
        return G.toJson(obj);
    }
}
