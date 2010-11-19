package api.activeX.notifiers
{
	import api.activeX.ActiveX;

	import api.events.activeX.notifiers.SetNotifyEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Property <code>event</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.notifiers.SetNotifyEvent.RESULT_EVENT
	 */
	/**
	 * Dispatched if the Property <code>event</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_EVENT
	 */
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.notifiers.SetNotifyEvent.RESULT_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Start receiving notifications when the specified <code>event</code> for
	 * the specified <code>object</code> is triggered.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setNotify.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setNotify.html Northcode Help Documentation
	 */
	public class SetNotify extends ActiveX
	{
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * The Event on the ActiveX Object that you want to listen for.
		 * 
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var event:String = null;
		
		/**
		 * The result data for the specified Event.
		 * 
		 * @defaultValue <code>null</code>
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setNotify.html Northcode Help Documentation
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var result:Array = null;
		
		/**
		 * Constructor for ActiveX.SetNotify()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setNotify.html Northcode Help Documentation
		 */
		public function SetNotify(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Start receiving notifications when the specified <code>event</code> for
		 * the specified <code>object</code> is triggered.
		 * 
		 * @param activeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * @param activeXEvent The Event on the ActiveX Object that you want to listen for.
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setNotify.html Northcode Help Documentation
		 */		
		/**
		 *
		 *
                 *
		 * @param activeXObject
                 *
		 * @param activeXEvent
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setNotify.html Northcode Help Documentation
		 */
		public function setNotify( activeXObject:String = null , activeXEvent:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			event = compareStrings( activeXEvent , event );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					switch( event )
					{
						case null:
							missingEvent();
							break;
						default:
							ssCore.ActiveX.setNotify( {object:object , event:event}
													 ,{callback:actionComplete, errorSTR:"setNotifyError", code:"15009"} );
					}
			}
		}
	}
}