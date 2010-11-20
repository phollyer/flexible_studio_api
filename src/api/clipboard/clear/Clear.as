package api.clipboard.clear
{
	import flash.events.IEventDispatcher;
	
	import api.clipboard.Clipboard;
	
	[Bindable]
	public class Clear extends Clipboard
	{
		public function Clear(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clear():void
		{
			ssCore.Clipboard.clear( {} , {callback:actionComplete, errorSTR:"clearError", code:"12001"} );
		}
	}
}