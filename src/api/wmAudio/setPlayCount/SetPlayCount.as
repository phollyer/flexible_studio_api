package api.wmAudio.setPlayCount
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Bindable]
	public class SetPlayCount extends WmAudio
	{
		// Optional 
		public var count:Number = 1;
		
		public function SetPlayCount(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setPlayCount():void
		{
			ssCore.WmAudio.setPlayCount( {count:count}
										,{callback:actionComplete, errorSTR:"setPlayCountError", code:"46006"} );
		}
	}
}