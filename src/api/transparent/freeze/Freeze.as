package api.transparent.freeze
{
	import flash.events.IEventDispatcher;
	import api.transparent.Transparent;
	
	[Bindable]
	public class Freeze extends Transparent
	{
		// Required
		public var flag:Boolean = true;
		
		public function Freeze(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function freeze():void
		{
			ssCore.Transparent.freeze( {flag:flag}
									  ,{callback:actionComplete, errorSTR:"freezeError", code:"42002"} );
		}
	}
}