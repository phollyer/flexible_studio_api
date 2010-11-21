package api.app.trace
{
	import api.app.App;

	import api.events.app.trace.TraceEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>text</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_TEXT
	*/
	[Event(name="missingText", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_trace.html Northcode Help Documentation
	*/
	public class Trace extends App
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var color:Number = 0;
		
		/**
		* Constructor for App.Trace()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_trace.html Northcode Help Documentation
		*/
		public function Trace(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param val
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_trace.html Northcode Help Documentation
		*/
		public function trace( val:String ):void
		{
			text = compareStrings( val , text );
                        switch( text )
                        {
                            case null:
                                missingText();
                                break;
                            default:
                                ssCore.App.trace( {text:text , color:color}, {callback:actionComplete, errorSTR:"traceError", code:"8004"} );
                        }
		}
	}
}