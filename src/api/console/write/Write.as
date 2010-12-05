package api.console.write
{
	import api.console.Console;

	import api.events.console.write.WriteEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>text</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_TEXT
	*/
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Send text to the console window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_write.html Northcode Help Documentation
	*/
	public class Write extends Console
	{
		/**
		* Text to be sent to the console window.
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		
		/**
		* Constructor for Console.Write()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_write.html Northcode Help Documentation
		*/
		public function Write(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Send text to the console window.
		*
		*
		* @param textSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_write.html Northcode Help Documentation
		*/
		public function write( textSTR:String = null ):void
		{
			text = compareStrings( textSTR , text );
			switch( text )
			{
				case null:
					missingText();
					break;
				default:
					ssCore.Console.write( {text:text} , {callback:actionComplete, errorSTR:"writeError", code:"14004"} );
			}
		}
	}
}