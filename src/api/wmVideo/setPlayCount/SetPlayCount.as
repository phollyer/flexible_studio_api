package api.wmVideo.setPlayCount
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetPlayCount extends WmVideo
	{
		// Optional 
		public var count:Number = 1;
		
		public function SetPlayCount(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setPlayCount():void
		{
			ssCore.WmVideo.setPlayCount( {count:count}
										,{callback:actionComplete, errorSTR:"setPlayCountError", code:"46010"} );
		}
	}
}