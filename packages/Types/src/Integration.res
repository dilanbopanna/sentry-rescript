/** Integration Class Interface */
type integrationClass<'a, 'b> = {
    /**
     * Property that holds the integration name
    */
    id: string, 
    constructer : @new (array<'a>) => 'b
}
type processEvent
type integrationFnResult<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l> =  {
  /**
   * The name of the integration.
   */
  name: string,

  /**
   * This hook is only called once, even if multiple clients are created.
   * It does not receives any arguments, and should only use for e.g. global monkey patching and similar things.
   */
  setupOnce?: ()=>(),

  /**
   * Set up an integration for the given client.
   * Receives the client as argument.
   *
   * Whenever possible, prefer this over `setupOnce`, as that is only run for the first client,
   * whereas `setup` runs for each client. Only truly global things (e.g. registering global handlers)
   * should be done in `setupOnce`.
   */
  setup?: (~client: Client.client<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l>) => (),

  /**
   * An optional hook that allows to preprocess an event _before_ it is passed to all other event processors.
   */
  preprocessEvent?: (~event: Event.event<'a>, ~hint: option<Event.eventHint<'a>> , ~client: Client.client<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l>)=>(),

  /**
   * An optional hook that allows to process an event.
   * Return `null` to drop the event, or mutate the event & return it.
   * This receives the client that the integration was installed for as third argument.
   */
  processEvent?: (~event: Event.event<'a>, ~hint: Event.eventHint<'a>, ~client: Client.client<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l>) => processEvent
}

type integrationFn<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l> = (~rest:array<'a>) => integrationFnResult<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l>

/** Integration interface */
type integration<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l> = {
  /**
   * Returns {@link IntegrationClass.id}
   */
  name: string,

  /**
   * Sets the integration up only once.
   * This takes no options on purpose, options should be passed in the constructor
   */
  setupOnce: (~addGlobalEventProcessor: (~callback: Eventprocessor.eventProcessor<'a, 'b, 'c>) => (), ~getCurrentHub: () => Hub.hub<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i>)=> (),

  /**
   * Set up an integration for the given client.
   * Receives the client as argument.
   *
   * Whenever possible, prefer this over `setupOnce`, as that is only run for the first client,
   * whereas `setup` runs for each client. Only truly global things (e.g. registering global handlers)
   * should be done in `setupOnce`.
   */
  setup?:(~client: Client.client<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l>)=>(),

  /**
   * An optional hook that allows to preprocess an event _before_ it is passed to all other event processors.
   */
  preprocessEvent?:(~event: Event.event<'a>, ~hint: option<Event.eventHint<'a>>, ~client: Client.client<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l>)=> (),

  /**
   * An optional hook that allows to process an event.
   * Return `null` to drop the event, or mutate the event & return it.
   * This receives the client that the integration was installed for as third argument.
   */
  processEvent?: (~event: Event.event<'a>, ~hint: Event.eventHint<'a>, ~client: Client.client<'a, 'b, 'c, 'd, 'e, 'f, 'g, 'h, 'i, 'j, 'k, 'l>) => processEvent
}