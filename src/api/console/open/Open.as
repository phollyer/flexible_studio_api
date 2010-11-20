package api.console.open
{
	import flash.events.IEventDispatcher;
	
	import api.console.Console;
	import api.vos.console.OpenVO;
	
	[Bindable]
	public class Open extends Console
	{
		public var consoleProperties:OpenVO = new OpenVO();
		
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function open():void
		{
			var __o : Object = consoleProperties.createObject();
			ssCore.Console.open( __o , {callback:actionComplete, errorSTR:"openError", code:"14002"} );
		}
	}
}