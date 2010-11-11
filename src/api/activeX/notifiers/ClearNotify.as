package api.activeX.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	import api.events.activeX.notifiers.ClearNotifyEvent;	
	
	/**
	 * Dispatched when the Property <code>event</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.notifiers.ClearNotifyEvent.RESULT_EVENT
	 */
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.notifiers.ClearNotifyEvent.RESULT_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Stop receiving Event notification for an Event previously specified in
	 * <code>setNotify()</code>.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_clearNotify.html Northcode Help Documentation
	 */
	public class ClearNotify extends ActiveX
	{
		/**
		 * The Event on the ActiveX Object that you want to listen for.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var event:String = null;
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		public function ClearNotify(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Stop receiving Event notification for an Event previously specified in
		 * <code>setNotify()</code>.
		 * 
		 * @param activeXOBject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object. 
		 * @param activeXEvent The Event on the ActiveX Object that you want to listen for.
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_clearNotify.html Northcode Help Documentation
		 */
		public function clearNotify( activeXObject:String = null , activeXEvent:String = null ):void
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
							ssCore.ActiveX.clearNotify( {object:object , event:event}
													   ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"15008"} );
					}
			}
		}

	}
}