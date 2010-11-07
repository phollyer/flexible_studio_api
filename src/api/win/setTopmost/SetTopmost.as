package api.win.setTopmost
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class SetTopmost extends Win
	{
		// Optional
		public var aggressive:Boolean = false;
		public var flag:Boolean = true;
		
		public function SetTopmost(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setTopmost():void
		{
			ssCore.Win.setTopmost( {aggrseeive:aggressive , flag:flag}
								  ,{callback:actionComplete, errorSTR:"setTopmostError", code:"6030"} );
		}
	}
}