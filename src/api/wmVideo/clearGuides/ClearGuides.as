package api.wmVideo.clearGuides
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class ClearGuides extends WmVideo
	{
		public function ClearGuides(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clearGuides():void
		{
			ssCore.WmVideo.clearGuides( {}
									   ,{callback:actionComplete, errorSTR:"clearGuidesError", code:"46000"} );
		}
	}
}