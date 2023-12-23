type \"exception"<'a> = {
    @as("type") type_?: string,
    value?: string,
    mechanism?: Mechanism.mechanism,
    @as("module") module_?:string, 
    thread_id?:float,
    stacktrace: Stacktrace.stacktrace<'a>    
}