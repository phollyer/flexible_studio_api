package api.app.trace
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	[Bindable]
	public class Trace extends App
	{
		public var text:String = null;
		public var color:Number = 0;
		
		public function Trace(target:IEventDispatcher=null)
		{
			super(target);
		}
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