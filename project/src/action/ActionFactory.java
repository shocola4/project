package action;

import action.Action;

import controller.BoardViewAction;
import controller.action.BoardCheckPassAction;
import controller.action.BoardCheckPassFormAction;

public class ActionFactory  {
    
    private static ActionFactory instance = new ActionFactory();
          
    private ActionFactory(){ 
        super();           
    }                    
    
    
    public static ActionFactory getInstance(){  
        return instance; 
    }                  
    
    
    public Action getAction(String command){ 
        Action action = null;
        System.out.println("ActionFactory :"+command); 

        

if(command.equals("board_check_pass_form")){  

                   action = new BoardCheckPassFormAction();

}else if(command.equals("board_check_pass")){  

                   action = new BoardCheckPassAction();

}



        return action; 
    }
}



