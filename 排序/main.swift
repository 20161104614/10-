//
//  main.swift
//  排序
//
//  Created by 彭皓 on 2018/9/14.
//  Copyright © 2018年 彭皓. All rights reserved.
//

import Foundation

var a = [22,13,5,1,23,4,23,1,23,4]
//这个我想的先把数组分开，分成一个一个的。
func paixu(_ leftIndex:Int,_ rightIndex:Int) -> (Array<Int>) {
    if leftIndex < rightIndex
    {
        //这个最少也有两个，那就接着往下分
        let i = (rightIndex+leftIndex)/2
        //这里就碰见递归了，paixu这个方法会一直下去，知道剩了一个，那最极端的就是aa里面只有一个元素，bb也是
        var aa = Array(paixu(leftIndex, i))
        var bb = Array(paixu(i+1, rightIndex))
        
        aa.append(Int.max)
        bb.append(Int.max)
        //返回已排好的序的数组，返回到上一层的paixu这，紧接着又一轮，直到最初的那个paixu。
        return paixushuzu(aa, bb)
        
    }else
    {
        return [a[rightIndex]]
        //这个显然就是一个返回单个值
    }
}
//这个方法是给定的两个排好序的数组，我会给合在一起，并且按着从小到大的排列
func paixushuzu(_ Arra:Array<Int>,_ Arrb:Array<Int>) -> (Array<Int>) {
    //给定新数组c
    var c = [Int]()
    
    var aa = 0 //计数Arra的下标
    var bb = 0 //计数Arrb的下标
    
    //这个条件很巧妙，只有c的个数等于了他们两个数组个数的和才会停止
    while c.count < Arrb.count+Arra.count-2 {
        //谁大取谁，接着下一个
        if Arra[aa] < Arrb[bb]
        {
            c.append(Arra[aa])
            if aa < Arra.count
            {
                aa+=1
            }
        }
        else
        {
            c.append(Arrb[bb])
            if bb < Arrb.count
            {
                bb+=1
            }
        }
    }
    //返回排好序的数组
    return c
}

print(paixu(0, a.count-1))
