package api.console.close
{
	import flash.events.IEventDispatcher;
	
	import api.console.Console;
	
	[Bindable]
	public class Close extends Console
	{
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function close():void
		{
			ssCore.Console.close( {} , {callback:actionComplete, errorSTR:"closeError", code:"14001"} );
		}
	}
}