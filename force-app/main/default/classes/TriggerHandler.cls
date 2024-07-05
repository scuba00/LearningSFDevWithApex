public virtual class TriggerHandler {
    protected virtual void beforeInsert () {}
    protected virtual void beforeUpdate () {}
    protected virtual void beforeDelete () {}
    protected virtual void afterInsert  () {}
    protected virtual void afterUpdate  () {}
    protected virtual void afterDelete  () {}
    protected virtual void afterUndelete() {}

    public void run(){
        switch on Trigger.operationType{
            when BEFORE_INSERT {
                this.beforeInsert();
            }
            when AFTER_INSERT {
                this.afterInsert();
            }
            when BEFORE_UPDATE {
                this.beforeUpdate();
            }
            when AFTER_UPDATE {
                this.afterUpdate();
            }
            when BEFORE_DELETE {
                this.beforeDelete();
            }
            when AFTER_DELETE {
                this.afterDelete();
            }
             when AFTER_UNDELETE {
                this.afterUndelete();
            }
        }    
    }

}