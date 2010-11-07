package api.wmVideo.setIndex
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Event(name="missingIndex" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetIndex extends WmVideo
	{
		// Optional 
		public var index:Number = -1;
		
		public function SetIndex(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setIndex( timeIndex:Number = -1 ):void
		{
			index = compareNumbers( timeIndex , index );
			
			switch( index > -1 )
			{
				case false:
					missingIndex();
					break;
				default:
					ssCore.WmVideo.setIndex( {index:index}
											,{callback:actionComplete, errorSTR:"setIndexError", code:"46008"} );
			}
		}
	}
}