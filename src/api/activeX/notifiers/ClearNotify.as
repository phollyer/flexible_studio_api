package api.activeX.notifiers
{
	import api.activeX.ActiveX;

	import api.events.activeX.notifiers.ClearNotifyEvent;

	import flash.events.IEventDispatcher;	
	
	/**
	* Dispatched if the Property <code>event</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_EVENT
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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_clearNotify.html Northcode Help Documentation
	*/
	public class ClearNotify extends ActiveX
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var event:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var object:String = null;
		
		/**
		* Constructor for ActiveX.ClearNotify()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_clearNotify.html Northcode Help Documentation
		*/
		public function ClearNotify(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @param activeXObject
		*
		* @param activeXEvent
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