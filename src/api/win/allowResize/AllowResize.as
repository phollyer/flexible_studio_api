package api.win.allowResize
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class AllowResize extends Win
	{
		// Optional
		public var flag:Boolean = true;
		
		public function AllowResize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function allowResize():void
		{
			ssCore.Win.allowResize( {flag:flag}
								   ,{callback:actionComplete, errorSTR:"allowResizeError", code:"6000"} );
		}
	}
}