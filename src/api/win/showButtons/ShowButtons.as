package api.win.showButtons
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class ShowButtons extends Win
	{
		// Optional
		public var close:Boolean = true;
		public var maximize:Boolean = true;
		public var minimize:Boolean = true;
		
		public function ShowButtons(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showButtons():void
		{
			ssCore.Win.showButtons( {close:close , maximize:maximize , minimize:minimize}
								   ,{callback:actionComplete, errorSTR:"showButtonsError", code:"6033"} );
		}
	}
}