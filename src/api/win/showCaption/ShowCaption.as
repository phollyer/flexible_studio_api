package api.win.showCaption
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class ShowCaption extends Win
	{
		// Optional
		public var flag:Boolean = true;
		
		public function ShowCaption(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showCaption():void
		{
			ssCore.Win.showCaption( {flag:flag}
								   ,{callback:actionComplete, errorSTR:"showCaptionError", code:"6034"} );
		}
	}
}