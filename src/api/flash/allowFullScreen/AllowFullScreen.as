package api.flash.allowFullScreen
{
	import flash.events.IEventDispatcher;
	import api.flash.Flash;
	
	[Bindable]
	public class AllowFullScreen extends Flash
	{
		public var flag:Boolean = true;
		
		public function AllowFullScreen(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function allowFullScreen():void
		{
			ssCore.Flash.allowFullScreen( {flag:flag}
										 ,{callback:actionComplete, errorSTR:"allowFullScreenError", code:"21000"} );
		}
	}
}