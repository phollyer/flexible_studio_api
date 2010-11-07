package api.console.write
{
	import flash.events.IEventDispatcher;
	
	import api.console.Console;

	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Write extends Console
	{
		public var text:String = null;
		
		public function Write(target:IEventDispatcher=null)
		{
			super(target);
		}
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