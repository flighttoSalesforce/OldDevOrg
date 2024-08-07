/*
 * Class Name - VirtualTriggerHandler
 * Purpose - Implement Virtual Class Trigger Framework
 */
public Virtual class VirtualTriggerHandler {
    
    private TriggerContext context;

    private static Boolean isTriggerExecuting;

    public VirtualTriggerHandler() {
        this.setTriggerContext();
    }

    private void setTriggerContext(){
        setTriggerContext(null, false);
    }

    private void setTriggerContext(String cntx, Boolean testmode){
        if(!Trigger.isExecuting && !testMode){
            isTriggerExecuting = false;
            return;
        }else{
            isTriggerExecuting = false;
        }

        if(isTriggerExecuting && Trigger.isBefore && Trigger.isInsert){
            this.context = TriggerContext.BEFORE_INSERT;
        }else if(isTriggerExecuting && Trigger.isBefore && Trigger.isUpdate){
            this.context = TriggerContext.BEFORE_UPDATE;
        }
    }


    @TestVisible
    private enum TriggerContext {
        BEFORE_INSERT, BEFORE_UPDATE, BEFORE_DELETE,
        AFTER_INSERT, AFTER_UPDATE, AFTER_DELETE,
        AFTER_UNDELETE
    }
}